-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 111.874001 , 89.249321 , 18.059164 , 9.900002 , [[Camera:ScriptSplineLookAtNpc(5118);]] )
   Camera:MotionSpline_AddSplinePoint( 112.960167 , 96.155029 , 18.059164 , 5.999997 , [[Camera:ScriptSplineLookAtNpc(5118);]] )
   Camera:MotionSpline_AddSplinePoint( 107.780869 , 104.774979 , 18.059164 , 9.800001 , [[Camera:ScriptSplineLookAtNpc(5118);]] )
   Camera:MotionSpline_AddSplinePoint( 100.202621 , 106.608818 , 18.059164 , 0.000000 , [[Camera:ScriptSplineLookAtNpc(5118);]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 10.000000 )
   Camera:MotionSpline_SetCorrection( 0.195313 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
