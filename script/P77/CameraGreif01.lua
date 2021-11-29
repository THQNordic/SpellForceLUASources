-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 95.292107 , 9.616250 , 38.116402 , 8.499996 , [[Camera:ScriptSplineLookAtNpc(5118);]] )
   Camera:MotionSpline_AddSplinePoint( 95.292107 , 9.616250 , 38.116402 , 5.599997 , [[Camera:ScriptSplineLookAtNpc(5118);]] )
   Camera:MotionSpline_AddSplinePoint( 95.292107 , 9.616250 , 38.116402 , 8.399996 , [[Camera:ScriptSplineLookAtNpc(5118);]] )
   Camera:MotionSpline_AddSplinePoint( 95.292107 , 9.616250 , 38.116402 , 0.000000 , [[Camera:ScriptSplineLookAtNpc(5118);]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 10.000000 )
   Camera:MotionSpline_SetCorrection( 0.039063 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
