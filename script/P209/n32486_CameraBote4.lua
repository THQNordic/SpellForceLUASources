-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 137.698212 , 570.791748 , 77.998764 , 0.000000 , [[Camera:ScriptSplineLookAtNpc(11786);]] )
   Camera:MotionSpline_AddSplinePoint( 137.698212 , 570.791748 , 77.998764 , 0.000000 , [[Camera:ScriptSplineLookAtNpc(11786);]] )
   Camera:MotionSpline_AddSplinePoint( 137.698212 , 570.791748 , 77.998764 , 0.000000 , [[Camera:ScriptSplineLookAtNpc(11786);]] )
   Camera:MotionSpline_AddSplinePoint( 137.698212 , 570.791748 , 77.998764 , 0.000000 , [[Camera:ScriptSplineLookAtNpc(11786);]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 10.000000 )
   Camera:MotionSpline_SetCorrection( 0.429688 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
